# Radio Frequencies

<div class="row row-cols-lg-2"><div>

Radio Frequencies are electromagnetic signals sent over a specific frequency such as 60 kilohertz (kHz).

To send our data over a communication channel, such as radio waves, we often use one modulation techniques among:

* **Amplitude Modulation (AM)** 📢
* **Frequency Modulation (FM)** 📻

FM as a few more advantages like it's more efficient.
</div><div>
</div></div>

<hr class="sep-both">

## Manipulating RF Recordings

[![rf_am_transmission](../../../../cybersecurity/_badges/rootme/network/rf_am_transmission.svg)](https://www.root-me.org/en/Challenges/Network/RF-AM-Transmission)

<div class="row row-cols-lg-2"><div>

#### GNU Radio

[GNU Radio](https://www.gnuradio.org/) is a suite of radio tools such as `gnuradio-companion` graphical editor that can be used to work on radio captures.

```shell!
$ sudo apt install -y gnuradio
$ gnuradio-companion
```

The right panel contains a list of components that we can drag to the main panel. For instance, drag a `File Source` and double-click on it to make it point to your capture. Set the type to `FLOAT`.

To hear a sound, we could use a `Audio Sink`. Connect both, and don't forget to set the type to `FLOAT` and try to find the `SampleRate`. You can enter arbitrary values such as `50000` for `50 kHz`.
</div><div>

#### Python

We could use the [soundfile](https://python-soundfile.readthedocs.io/) library:

```py
# pip install soundfile sounddevice numpy
import soundfile as sf
import sounddevice as sd

sig, fs = sf.read('<AM recording>', channels=1, samplerate=50000, format='RAW', subtype='FLOAT', endian='LITTLE')
sd.play(sig, fs, blocking=True)
```

#### Additional tools

* Audacity may work for some transmissions
* We can use `aplay` from `alsa-utils`:

```shell!
$ cat <AM recording> | aplay -f FLOAT_LE -r <sample rate>
```
</div></div>

<hr class="sep-both">

## 👻 To-do 👻

Stuff that I found, but never read/used yet.

<div class="row row-cols-lg-2"><div>

* Capture with a software-defined radio (SDR)?
* [hacktricks RFID](https://book.hacktricks.xyz/todo/radio-hacking/pentesting-rfid)
* [proxmark3 RFID](https://github.com/Proxmark/proxmark3)
* [rftap](https://rftap.github.io/)
</div><div>

* [Universal Radio Hacker](https://github.com/jopohl/urh) <small>(10.4k ⭐)</small>

```ps
$ DEST="$HOME/tools/urh"
$ git clone -b "master" https://github.com/jopohl/urh.git $DEST
$ pip install cython # no venv because their setup.py is a pain
$ python $DEST/setup.py install --user
$ urh
```
</div></div>