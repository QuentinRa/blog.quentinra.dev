# OVAL

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

OVAL is used in many files of the project, but there are barely any resources to learn about its syntax 📉.

The usual template is something like this:

```xml
<def-group>
  <!-- ... -->
  <definition class="..." id="..." version="...">
      <criteria>
          <criterion test_ref="..." />
      </criteria>
  </definition>
  <!-- body -->
</def-group>
```

The `class`, `id`, `version`, and `test_ref` values are specific to what  kind of file you're creating. Others elements are explained here. 

➡️ Basic concepts are [explained here](https://ovalproject.github.io/getting-started/tutorial/).
</div><div>

`criteria` define what to do to **pass the check**. You can ask for all checks to be true <small>(AND)</small>, or only at least one <small>(OR)</small>.

```xml!
<criteria operator="AND" [...] >
<criteria operator="OR" [...] >
```

A criteria may have children of type `criteria`, or `criterion`. For the later, they are referencing the test that will be done.

```xml!
<criterion test_ref="..." />
<criterion test_ref="..." negate="true" />
```

💡 Criterion might not be the only tag that support `negate`.

🎉 As a quick reminder, you can use [**jinja**](jinja.md) macros in your OVAL files!
</div></div>

<hr class="sep-both">

## Tests

<div class="row row-cols-md-2"><div>

Tests are tag ending with `_test`. The usually have one or two children of type `_object`, and `_state` respectfully.

⚠️ Absence of the `comment` attribute on a `_test` will make the build crash as they are displayed in the HTML report.
</div><div>

#### textfilecontent54

A common tag to test file content.

```xml
<ind:textfilecontent54_test id="xxx" check="all" comment="">
    <ind:object object_ref="obj_xxx" />
</ind:textfilecontent54_test>

<ind:textfilecontent54_object id="obj_xxx">
    <!-- see ind tags section -->
</ind:textfilecontent54_object>
```

You can use the following attributes on `textfilecontent54_test`

* `check_existence="all_exist"`: all objects found
* `check_existence="none_exist"`: no valid object found

➡️ See also: `textfilecontent54_state`.
</div></div>

<hr class="sep-both">

## ind tags

<div class="row row-cols-md-2"><div>

While I'm not sure what's `ind`, the following tags are quite handy.

#### Select a file/folder

You can either give the path:

```xml!
<ind:filepath>/path/to/file</ind:filepath>
```

Or, load files in the current folder:

```xml!
<!-- set current folder -->
<ind:path>/path/to/</ind:path>
<!-- pick one -->
<ind:filename datatype="string">xxx.config</ind:filename>
<ind:filename operation="pattern match">^*\.config$</ind:filename>
```
</div><div>

#### Check if a pattern is inside a file

You can "grep" to see if a pattern is inside a file. There are no fancy options like "grep" <small>(case insensitive, multiple lines...)</small>.

```xml!
<ind:pattern operation="pattern match">some_line_here</ind:pattern>
<ind:pattern operation="pattern match">^some_regex_here$</ind:pattern>
```

Then, you assert what result you expect

```xml!
<ind:instance datatype="int">1</ind:instance>
<ind:instance datatype="int" operation="greater than or equal">1</ind:instance>
<ind:instance datatype="int" operation="equals">1</ind:instance>
```

⚠️ If the second line is missing, build will fail.
</div></div>

<hr class="sep-both">

## Variables

<div class="row row-cols-md-2"><div>

You can use sets defined in a variable. For instance, if you want to check that at least one file exists and is correct.

From tags such as `ind:path`, you can use these attributes:

```xml!
<xxx var_ref="var_xxx" var_check="at least one" />
<xxx var_ref="var_xxx" var_check="at least one" datatype="string" />
```

The variable can be either `local` or `external`.
</div><div>

#### Local variable

A local variable is declared inside the OVAL file.

```xml
<constant_variable datatype="string" comment="XXX"
  id="var_xxx" version="1">
    <value>zzz</value> <!-- one per value -->
  </constant_variable>
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-md-2"><div>

```xml!
<extend_definition comment="xxx" definition_ref="yyy" />
<external_variable datatype="int" id="var_xxx" />
```
</div><div>

* Can change some values in the generated XML
</div></div>