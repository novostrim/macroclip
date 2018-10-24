method vfBtnList vfBtnList.mLoad <alias=vfBtnList_mLoad>( )   
{   
//	this->vForm.mCreateWin()
	ustr empus
	str  emps
	ustr ustmp
	uint comp
	comp as this
		comp.AutoLang=1
		comp.Border=$fbrdNone
		comp.Bottom=0
		comp.Caption=empus
		comp.Enabled=1
		comp.FormStyle=$fsChild
		comp.Height=226
		comp.HelpTopic=empus
		comp.Hint=empus
		comp.HorzAlign=$alhClient
		comp.IconName=empus
		comp.Left=0
		comp.Name="fBtnList"
		comp.Right=0
		comp.StartPos=$spDesigned
		comp.Style=emps
		comp.TabOrder=0
		comp.Tag=0
		comp.Top=0
		comp.TopMost=1
		comp.VertAlign=$alvClient
		comp.Visible=1
		comp.Width=378
		comp.WindowState=$wsNormal
		comp.OnCreate.Set( this, fBtnList_Create )
		comp as this.sbMain
		comp.Owner = this
			comp.AutoLang=1
			comp.AutoScroll=1
			comp.Border=$brdNone
			comp.Bottom=27
			comp.Enabled=1
			comp.Height=181
			comp.HelpTopic=empus
			comp.Hint=empus
			comp.HorzAlign=$alhClient
			comp.HorzRange=46
			comp.Left=0
			comp.Name="sbMain"
			comp.Right=0
			comp.Style=emps
			comp.TabOrder=0
			comp.Tag=0
			comp.Top=0
			comp.VertAlign=$alvClient
			comp.VertRange=52
			comp.Visible=1
			comp.Width=360
			comp.OnMouse.Set( this, fBtnList_Mouse )
			comp as this.tbItems
			comp.Owner = this.sbMain
				comp.AutoLang=0
				comp.AutoSize=0
				comp.Bottom=0
				comp.Enabled=1
				comp.Height=26
				comp.HelpTopic=empus
				comp.Hint=empus
				comp.HorzAlign=$alhLeftRight
				comp.ImageList=ustmp.fromutf8("project")
				comp.Left=46
				comp.Name="tbItems"
				comp.Right=-2
				comp.ShowCaption=$tscRight
				comp.ShowDivider=0
				comp.Style=emps
				comp.TabOrder=0
				comp.Tag=0
				comp.Top=0
				comp.VertAlign=$alvTop
				comp.Vertical=1
				comp.Visible=1
				comp.Width=316
				comp.Wrapable=1
				comp.OnMouse.Set( this, fBtnList_ItemMouse )
			comp as this.tbPaste
			comp.Owner = this.sbMain
				comp.AutoLang=1
				comp.AutoSize=0
				comp.Bottom=0
				comp.Enabled=1
				comp.Height=25
				comp.HelpTopic=empus
				comp.Hint=empus
				comp.HorzAlign=$alhLeft
				comp.ImageList=ustmp.fromutf8("project")
				comp.Left=23
				comp.Name="tbPaste"
				comp.Right=0
				comp.ShowCaption=$tscNone
				comp.ShowDivider=0
				comp.Style=emps
				comp.TabOrder=1
				comp.Tag=0
				comp.Top=0
				comp.VertAlign=$alvTop
				comp.Vertical=1
				comp.Visible=1
				comp.Width=23
				comp.Wrapable=1
			comp as this.tbCopy
			comp.Owner = this.sbMain
				comp.AutoLang=1
				comp.AutoSize=0
				comp.Bottom=0
				comp.Enabled=1
				comp.Height=52
				comp.HelpTopic=empus
				comp.Hint=empus
				comp.HorzAlign=$alhLeft
				comp.ImageList=ustmp.fromutf8("project")
				comp.Left=0
				comp.Name="tbCopy"
				comp.Right=0
				comp.ShowCaption=$tscNone
				comp.ShowDivider=0
				comp.Style=emps
				comp.TabOrder=2
				comp.Tag=0
				comp.Top=0
				comp.VertAlign=$alvTop
				comp.Vertical=1
				comp.Visible=1
				comp.Width=23
				comp.Wrapable=1
	comp as this
		comp.ClientHeight=181
		comp.ClientWidth=360

	return this
}

method vfBtnList vfBtnList.init( )
{
   this.pTypeId = vfBtnList         
   return this
}
func init_vfBtnList <entry>()
{
   regcomp( vfBtnList, "vfBtnList", vForm, $vForm_last,
      %{ %{$mLoad,     vfBtnList_mLoad}},
      0->collection )
      
}
