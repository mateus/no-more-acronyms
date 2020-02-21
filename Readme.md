### Converts a YAML dictionary of acronyms into a PLIST of Text Substitutions for Mac

#### Using local YMAL (./acronyms.yml)

`$ ruby no-more-acronyms.rb`

#### Using YMAL from custom path

`$ ruby no-more-acronyms.rb {path}`

### Example

```
$ ruby no-more-acronyms.rb

/============ Text Substitutions.plist ============\
<?xml version="1.0"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <array>
    <dict>
      <key>phrase</key>
      <string>on my way</string>
      <key>shortcut</key>
      <string>OMW</string>
    </dict>
    <dict>
      <key>phrase</key>
      <string>Oh my God</string>
      <key>shortcut</key>
      <string>OMG</string>
    </dict>
    <dict>
      <key>phrase</key>
      <string>be right back</string>
      <key>shortcut</key>
      <string>BRB</string>
    </dict>
    <dict>
      <key>phrase</key>
      <string>by the way</string>
      <key>shortcut</key>
      <string>BTW</string>
    </dict>
  </array>
</plist>
\============ Text Substitutions.plist ============/
```
