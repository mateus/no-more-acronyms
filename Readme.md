### Converts a YAML dictionary of acronyms into a PLIST of Text Substitutions for Mac

`$ ruby no-more-acronyms.rb [paths.yml]`

### Example

```
$ ruby no-more-acronyms.rb ./templates/developers.yml ./templates/acronyms.yml
results/developers.plist CREATED
results/acronyms.plist CREATED

Drag created files to Settings > Keyboard > Text configuration window
```

![nmar](https://user-images.githubusercontent.com/2091116/75079693-a15ab680-54d7-11ea-9bbc-6a9910597ce8.gif)
