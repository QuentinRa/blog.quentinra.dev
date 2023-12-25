import re
import sys


class FilteringHandler:
    def __init__(self, is_filter, status_codes, response_line_count, regex, response_size, response_word_count):
        self.isFilter = is_filter
        if self.isFilter:
            self.name = "Filter"
        else:
            self.name =  "Matcher"
        self.status_code = status_codes
        self.line_count = response_line_count
        self.size = response_size
        self.word_count = response_word_count
        if regex is not None:
            self.regex = re.compile(regex)
        else:
            self.regex = None

        self._allowed_code = self.expand(status_codes)
        self._allowed_line_count = self.expand(response_line_count)
        self._allowed_word_count = self.expand(response_word_count)
        self._allowed_size = self.expand(response_size)

    def _is_filter_valid_given_array(self, str_definition, current_value, array_definition):
        """
        A rule is not valid when it exists and the value isn't matching the definition
        If there is no constraint. then returns !isFilter.
        """
        if str_definition is None:
            return not self.isFilter
        return current_value in array_definition

    def _is_filter_valid_given_regex(self, regex, current_value):
        """
        A rule is not valid when it exists and the value isn't matching the definition
        If there is no constraint. then returns !isFilter.
        """
        if regex is None:
            return not self.isFilter
        return self.regex.search(current_value) is not None

    def is_valid(self, status_code, line_count, content, response_size, word_count):
        # if status code in array
        #   if it's a filter, then it's filtered (True == True)
        #   else if it's not a filter, process (False == True)
        # else
        #   if it's a filter, then process (False == True)
        #   else if it's not a filter, then it's filtered (True)
        if self._is_filter_valid_given_array(self.status_code, status_code, self._allowed_code) == self.isFilter:
            return False

        if self._is_filter_valid_given_array(self.line_count, line_count, self._allowed_line_count) == self.isFilter:
            return False

        if self._is_filter_valid_given_array(self.size, response_size, self._allowed_size) == self.isFilter:
            return False

        if self._is_filter_valid_given_array(self.word_count, word_count, self._allowed_word_count) == self.isFilter:
            return False

        if self._is_filter_valid_given_regex(self.regex, content) == self.isFilter:
            return False

        return True

    def expand(self, string):
        result = []
        if string is not None:
            parts = [part.strip() for part in string.split(',')]
            for part in parts:
                if '-' in part:
                    start, end = part.split('-')
                    start, end = int(start), int(end)
                    if start > end:
                        print(f'[ERROR] Invalid range ({start},{end})')
                        sys.exit(2)
                    result.extend(range(start, end + 1))
                else:
                    result.append(int(part))
        return result
