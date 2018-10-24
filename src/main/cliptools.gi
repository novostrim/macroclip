method vfClipTools vfClipTools.mLoad <alias=vfClipTools_mLoad>( )   
{   
//	this->vForm.mCreateWin()
	ustr empus
	str  emps
	ustr ustmp
	uint comp
	comp as this
		comp.AutoLang=1
		comp.Border=$fbrdSizeToolWin
		comp.Bottom=0
		comp.Caption=empus
		comp.Enabled=1
		comp.FormStyle=$fsPopup
		comp.Height=575
		comp.HelpTopic=empus
		comp.Hint=empus
		comp.HorzAlign=$alhLeft
		comp.IconName=empus
		comp.Left=0
		comp.Name="fClipTools"
		comp.Right=0
		comp.StartPos=$spDesigned
		comp.Style=emps
		comp.TabOrder=0
		comp.Tag=0
		comp.Top=0
		comp.TopMost=1
		comp.VertAlign=$alvTop
		comp.Visible=1
		comp.Width=398
		comp.WindowState=$wsNormal
		comp.OnMouse.Set( this, fClipTools_fm )
		comp.OnCreate.Set( this, fClipTools_Create )
		comp.OnDestroy.Set( this, fClipTools_Destroy )
		comp.OnCloseQuery.Set( this, fClipTools_Close )
		comp as this.Tab0
		comp.Owner = this
			comp.AutoLang=1
			comp.Bottom=0
			comp.Enabled=1
			comp.FixedWidth=0
			comp.Height=530
			comp.HelpTopic=empus
			comp.Hint=empus
			comp.HorzAlign=$alhClient
			comp.ImageList=ustmp.fromutf8("groups")
			comp.Left=0
			comp.Name="Tab0"
			comp.Right=0
			comp.Style=emps
			comp.TabOrder=0
			comp.TabStyle=$tsNone
			comp.Tag=0
			comp.Top=0
			comp.VertAlign=$alvTopBottom
			comp.Visible=1
			comp.Width=380
			comp as this.tiHistory
			comp.Owner = this.Tab0
				comp.AutoLang=1
				comp.Bottom=0
				comp.Caption=ustmp.fromutf8("history")
				comp.Enabled=1
				comp.Height=501
				comp.HelpTopic=empus
				comp.Hint=empus
				comp.HorzAlign=$alhLeft
				comp.ImageId=ustmp.fromutf8("history")
				comp.Left=4
				comp.Name="tiHistory"
				comp.Right=0
				comp.Style=emps
				comp.TabOrder=0
				comp.Tag=0
				comp.Top=25
				comp.VertAlign=$alvTop
				comp.Visible=1
				comp.Width=372
		comp as this.Tab0
		comp.Owner = this
			comp.CurIndex=0
		comp as this.ToolBar0
		comp.Owner = this
			comp.AutoLang=1
			comp.AutoSize=0
			comp.Bottom=5
			comp.Enabled=1
			comp.Height=25
			comp.HelpTopic=empus
			comp.Hint=empus
			comp.HorzAlign=$alhLeft
			comp.ImageList=ustmp.fromutf8("main")
			comp.Left=0
			comp.Name="ToolBar0"
			comp.Right=0
			comp.ShowCaption=$tscNone
			comp.ShowDivider=0
			comp.Style=emps
			comp.TabOrder=1
			comp.Tag=0
			comp.Top=500
			comp.VertAlign=$alvBottom
			comp.Vertical=0
			comp.Visible=0
			comp.Width=75
			comp.Wrapable=0
			comp as this.tbiMainWin
			comp.Owner = this.ToolBar0
				comp.AutoLang=1
				comp.Caption=ustmp.fromutf8("mainwin")
				comp.Checked=0
				comp.Enabled=1
				comp.Hint=empus
				comp.ImageId=ustmp.fromutf8("mclip")
				comp.Index=0
				comp.Name="tbiMainWin"
				comp.ShowCaption=0
				comp.Tag=0
				comp.TBIStyle=$tbsAsCheckBox
				comp.Visible=1
				comp.OnClick.Set( this, fClipTools_MainWin )
			comp as this.ToolBarItem0
			comp.Owner = this.ToolBar0
				comp.AutoLang=1
				comp.Caption=ustmp.fromutf8("ToolBarItem0")
				comp.Checked=0
				comp.Enabled=1
				comp.Hint=empus
				comp.ImageId=empus
				comp.Index=1
				comp.Name="ToolBarItem0"
				comp.ShowCaption=0
				comp.Tag=0
				comp.TBIStyle=$tbsButton
				comp.Visible=1
		comp as this.Tray0
		comp.Owner = this
			comp.AutoLang=1
			comp.Caption=ustmp.fromutf8("progname")
			comp.Image=ustmp.fromutf8("main\\mclip")
			comp.Name="Tray0"
			comp.RBtnPopupMenu=.pmTray
			comp.Tag=0
			comp.Visible=0
			comp.OnMouse.Set( this, fClipTools_Tray )
		comp as this.pmTray
		comp.Owner = this
			comp.AutoLang=1
			comp.Name="pmTray"
			comp.Tag=0
			comp as this.miExit
			comp.Owner = this.pmTray
				comp.AutoCheck=0
				comp.AutoLang=1
				comp.Caption=ustmp.fromutf8("exit")
				comp.Checked=0
				comp.Ellipsis=0
				comp.Enabled=1
				comp.Image=empus
				comp.Name="miExit"
				comp.RadioCheck=0
				comp.Separator=0
				comp.ShortKey=empus
				comp.Tag=0
				comp.Visible=1
				comp.OnClick.Set( this, fClipTools_Exit )
		comp as this.timerRestore
		comp.Owner = this
			comp.AutoLang=1
			comp.Enabled=0
			comp.Interval=1000
			comp.Name="timerRestore"
			comp.Tag=0
			comp.OnTimer.Set( this, fClipTools_Restore )
		comp as this.pmBtns
		comp.Owner = this
			comp.AutoLang=1
			comp.Name="pmBtns"
			comp.Tag=0
			comp.OnBeforeShow.Set( this, fClipTools_PopupBtns )
			comp.OnAfterShow.Set( this, fClipTools_PopupClose )
			comp as this.miCopyToNotices
			comp.Owner = this.pmBtns
				comp.AutoCheck=0
				comp.AutoLang=1
				comp.Caption=ustmp.fromutf8("copytonotices")
				comp.Checked=0
				comp.Ellipsis=0
				comp.Enabled=1
				comp.Image=empus
				comp.Name="miCopyToNotices"
				comp.RadioCheck=0
				comp.Separator=0
				comp.ShortKey=empus
				comp.Tag=0
				comp.Visible=0
			comp as this.miDelete
			comp.Owner = this.pmBtns
				comp.AutoCheck=0
				comp.AutoLang=1
				comp.Caption=ustmp.fromutf8("delete")
				comp.Checked=0
				comp.Ellipsis=0
				comp.Enabled=1
				comp.Image=empus
				comp.Name="miDelete"
				comp.RadioCheck=0
				comp.Separator=0
				comp.ShortKey=empus
				comp.Tag=0
				comp.Visible=1
				comp.OnClick.Set( this, fClipTools_DeleteItem )
			comp as this.MenuItem0
			comp.Owner = this.pmBtns
				comp.AutoCheck=0
				comp.AutoLang=1
				comp.Caption=ustmp.fromutf8("edit")
				comp.Checked=0
				comp.Ellipsis=0
				comp.Enabled=1
				comp.Image=empus
				comp.Name="MenuItem0"
				comp.RadioCheck=0
				comp.Separator=0
				comp.ShortKey=empus
				comp.Tag=0
				comp.Visible=0
				comp.OnClick.Set( this, fClipTools_EditItem )
	comp as this
		comp.ClientHeight=530
		comp.ClientWidth=380

	return this
}

method vfClipTools vfClipTools.init( )
{
   this.pTypeId = vfClipTools         
   return this
}
func init_vfClipTools <entry>()
{
   regcomp( vfClipTools, "vfClipTools", vForm, $vForm_last,
      %{ %{$mLoad,     vfClipTools_mLoad}},
      0->collection )
      
}
