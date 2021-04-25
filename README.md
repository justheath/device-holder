One of my first designs using OpenSCAD.

Initially created to hold a battery pack for my dad and allow him to mount on his recumbent bike. I was relieved that I still had the design when he asked me for another a few months later.

## Using the designs

Open `battery-holder.scad` with OpenSCAD and use the parameters in the customizer to fit your device. You can adjust tolerances to make sure it's not too tight, customized the wall and bottom thickness for strength, and customize the number of side holes and slots in the bottom.

During design I felt it useful to show a block the size of the device to help me visualize how it all fit. You can do this by setting `testFit = true`.

I did not have the device I was printing for so made a "sample". You too can test fit by adjusting parameters in `sample_device.scad` to those of your device. It's a very simple, walls only design to see how the device will fit.

The design has been tested with OpenSCAD 2019.05.

## Attribution

[OpenSCAD Screw Holes by carloverse](https://www.thingiverse.com/thing:1731893) is licensed under Creative Commons - Share Alike - Attribution.

## License

<p xmlns:dct="http://purl.org/dc/terms/" xmlns:vcard="http://www.w3.org/2001/vcard-rdf/3.0#">
  <a rel="license"
     href="http://creativecommons.org/publicdomain/zero/1.0/">
    <img src="http://i.creativecommons.org/p/zero/1.0/88x31.png" style="border-style: none;" alt="CC0" />
  </a>
  <br />
  To the extent possible under law,
  <a rel="dct:publisher"
     href="https://github.com/justheath/device-holder">
    <span property="dct:title">Heath Carr</span></a>
  has waived all copyright and related or neighboring rights to
  <span property="dct:title">Device Holder</span>.
This work is published from:
<span property="vcard:Country" datatype="dct:ISO3166"
      content="US" about="https://github.com/justheath/device-holder">
  United States</span>.
</p>
