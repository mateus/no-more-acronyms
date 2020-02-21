### Converts a YAML dictionary of acronyms into a PLIST of Text Substitutions for Mac

`$ ruby no-more-acronyms.rb [paths]`

### Example

```
$ ruby no-more-acronyms.rb ./templates/developers.yml ./templates/acronyms.yml
results/developers.plist CREATED
results/acronyms.plist CREATED

Drag created files to Settings > Keyboard > Text configuration window
```
