
command! -nargs=* -range GoAddTags call go#tags#Add(<line1>, <line2>, <count>, <f-args>)
command! -nargs=* -range GoRemoveTags call go#tags#Remove(<line1>, <line2>, <count>, <f-args>)
command! -nargs=0 GoFillStruct call go#fillstruct#FillStruct()

command! -nargs=0 GoFmt call go#fmt#Format(-1)
command! -nargs=0 GoFmtAutoSaveToggle call go#fmt#ToggleFmtAutoSave()
command! -nargs=0 GoImports call go#fmt#Format(1)


