XPTemplate priority=lang

XPTvar $BRloop      \n
XPTvar $BRfunc      \n

" ========================= Function and Variables =============================

" ================================= Snippets ===================================
XPTemplateDef


XPT t " this
$this->

XPT tp " this->params
$this->params->

XPT m " Manis namespace
Manis

XPT e " Eredmenyek namespace
Eredmenyek

XPT Sto hint=StorableList
StorableList( '`className^', array( 'where' => "`where^"`, 'orderby' => `orderby?^ ) );


XPT slist hint=new\ StorableList
new StorableList( '`className^', array( 'where' => "`where^"`, 'orderby' => `orderby?^ ) );


XPT clist hint=StorableList\ create
StorableList::create( '`className^', array( 'where' => "`where^"`, 'orderby' => `orderby?^ ) );

XPT ifcl hint=if\ count\ list
if ( count( $list ) )
{
    $obj = $list[0];
}
else
{
    $obj = new `classname^();
}

XPT pr hint=ITK::print_r
ITK::print_r(`cursor^);

XPT funca hint=Action\ method
public function `name^()
{
    $retval = `cursor^;
    return $retval;
}
" ================================= Wrapper ===================================
