# Compilation

[Go back](../index.md)

<div class="row row-cols-md-2"><div>

The easiest way to build a product is to use their script:

```ps
$ ./build_product parrot
```

If you got errors, you may want to execute the fail command yourself, if any, to see more output. Otherwise, good luck 🍀.

Given a generated XML, you can check if it's correct using:

```ps
$ oscap ds sds-validate ssg-xxx-ds.xml
```
</div><div>

#### Scripts

To execute scripts, you need to source `.pyenv.sh` first, and index rules. After **each** product compilation, build is cleaned, so you need call `./utils/rule_dir_json.py` again.

```ps
$ alias python=python3 # if python is not found
$ source .pyenv.sh # run only once
$ ./utils/rule_dir_json.py # build/rule_dirs.json
```

If **build is rather empty** <small>(only rule_dirs.json)</small>, you also have to call:

```ps
$ cd build
$ cmake ..
$ cd ..
```
</div></div>