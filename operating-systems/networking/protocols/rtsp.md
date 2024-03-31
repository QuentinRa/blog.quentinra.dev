# Real Time Streaming Protocol (RTSP)

[![adventofcyber4](../../../cybersecurity/_badges/thm/adventofcyber4/day21.svg)](https://tryhackme.com/room/adventofcyber4)

<div class="row row-cols-lg-2"><div>

Real Time Streaming Protocol (RTSP) is a protocol designed  to control streaming media servers. It allows clients to remotely control the playback of media files, as well as live media streams, over a network.

🐊️ **Ports**: 554 <small>(TCP)</small> or 8554 <small>(TCP)</small>

You can run your own server using [mediamtx](https://github.com/bluenviron/mediamtx) <small>(9.7k ⭐)</small>:

```shell!
$ docker run --rm -it --network=host aler9/rtsp-simple-server
$ docker run --rm -it -e RTSP_PROTOCOLS=tcp -p 8554:8554 -p 1935:1935 -p 8888:8888 aler9/rtsp-simple-server
```
</div><div>

You can view a live video and save it using []():

```shell!
$ sudo apt-get install -y ffmpeg
$ ffplay rtsp://localhost:8554/mystream # watch live
$ ffmpeg -i rtsp://localhost:8554/mystream output_file.mp4
<press q when you want to stop the capture>
$ vlc rtsp://localhost:8554/mystream
```
</div></div>