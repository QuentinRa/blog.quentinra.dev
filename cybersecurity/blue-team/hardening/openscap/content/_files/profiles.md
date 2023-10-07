# Profiles

<div class="row row-cols-md-2"><div>

#### Selections

Selections is a list of rules IDs that are tested when selecting this profile. However, **it's not always enough to add a rule here**, you may have to edit the rule `prodtype` attribute too.

👉 See the [Rules#prodtype](rules.md#prodtype) attribute.

☠️ If the `prodtype` attribute is present, you'll either get an error during build <small>(unselects all groups)</small>, or the rule may be silently removed.

<br>

#### Find rules

To find rules, you can look at other profiles or controls files, or you can use `find linux_os -name *ftp* -type d 2> /dev/null` <small>(ex: for ftp rules)</small>.
</div><div>
</div></div>