<!--
https://wiki.archlinux.org/index.php/Youtube-dl
https://www.stefaanlippens.net/audio_conversion_execution_speed_comparison_of_SoX_FFmpeg_MPlayer/
http://linux-audio.4202.n7.nabble.com/Resampling-SOX-vs-FFmpeg-td108394.html
http://normalize.nongnu.org/
https://gist.github.com/lightrush/4fc5b36e01db8fae534b0ea6c16e347f
https://askubuntu.com/questions/246242/how-to-normalize-sound-in-mp3-files
https://superuser.com/questions/23156/linux-audio-tools-is-there-a-way-to-normalize-the-volume-of-ogg-files
https://github.com/slhck/ffmpeg-normalize
https://github.com/kepstin/opusgain
https://stackoverflow.com/questions/25569180/ffmpeg-convert-without-loss-quality
https://wiki.hydrogenaud.io/index.php?title=ReplayGain
http://wiki.hydrogenaud.io/index.php?title=ReplayGain_specification

[SVG](https://www.opensymbols.org/symbols/noun-project/music-789d0de6?id=35928dan)

![SVG](https://d18vdu4p71yql0.cloudfront.net/libraries/noun-project/Music-24b69f41d0.svg)

-->

[MDN](https://developer.mozilla.org)\
[Media container formats (file types) guide](https://developer.mozilla.org/docs/Web/Media/Formats/Containers)\
[Web video codec guide](https://developer.mozilla.org/docs/Web/Media/Formats/Video_codecs)\
[Web audio codec guide](https://developer.mozilla.org/docs/Web/Media/Formats/Audio_codecs)

|ID|Title|Artist|Subs|
|-|-|-|-:|
|fGXCKG6o2Ow|RESISTER|ASCA|ja vtt|
|ZUa46pvH1m0|鳥の詩|Pan Piano||
|W4VTq0sa9yg|GTA San Andreas Theme Song|||
|UvL8OsG75f0|CHAOS glitch|||
|5LtgfeS8kdM|V glitch|||
|&nbsp;||||
|Ey_NHZNYTeE|脳漿炸裂ガール|れるりり|ja vtt|
|h0FtaC_-hKQ|我和我的趙國||zh-Hant vtt|
|&nbsp;||||
|Pim5d5fv0J0|作家彼女|ぺんたぶ||
|-C7HymPMq_8|春にとける|||
|&nbsp;||||
|K_xTet06SUo|千本桜|和楽器バンド||
|ekP7VLeXnqY|春はゆく|Aimer||
|gMLeRX3-ZzY|Tokyo-Hot Theme Song|Tokyo-Hot||
|Oxff6dTtiq0|운명(Oon Myung)[Fate]|WHY||
|[sm31723013](https://www.nicovideo.jp/watch/sm31723013)|ソビエト国歌 日本語吹替版|ChaChaMARU||
|&nbsp;||||
|5wjGc1zGWBc|Mera Joota Hai Japani|Shankar Jaikishan||
|||||

<!--
|||||
-->

```bash
source ./youtube.bash_aliases
```

[Filter syntax](https://trac.ffmpeg.org/wiki/FilteringGuide#Filtersyntax) ([details](http://ffmpeg.org/ffmpeg-filters.html#Filtergraph-syntax-1))

```
<filter>=<opt1>=<val1>:<opt2>=<val2>:<opt3>=<val3>
```

[loudnorm](https://ffmpeg.org/ffmpeg-filters.html#loudnorm)

```bash
ffmpeg -i fGXCKG6o2Ow.opus -vn -filter:a loudnorm=print_format=summary tmp.opus
```