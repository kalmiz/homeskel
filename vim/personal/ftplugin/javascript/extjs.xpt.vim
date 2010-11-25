XPTemplate priority=lang

" ========================= Function and Variables =============================

" ================================= Snippets ===================================
XPTemplateDef

XPT combo hint=ComboBox
new Ext.form.ComboBox({
    id:             `id^,
    name:           `name^,
    hiddenName:     `hiddenName^,
    valueField:     `valueField^,
    displayField:   `displayField^,
    value:          `value^,
    store:          store,
    mode:           '`mode^',
    typeAhead:      `$TRUE^,
    forceSelection: `$TRUE^,
    triggerActions: 'all',
    emptyText:      'Válassz...'
});
XSET mode=ChooseStr( 'local', 'remote' )

