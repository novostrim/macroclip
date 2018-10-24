<_ TypeName = vForm >
 <Properties >
  <AutoLang >1</>
  <Border >fbrdSizeToolWin</>
  <Bottom >0</>
  <Enabled >1</>
  <FormStyle >fsPopup</>
  <Height >575</>
  <HelpTopic />
  <Hint />
  <HorzAlign >alhLeft</>
  <Left >0</>
  <Name >fClipTools</>
  <Right >0</>
  <StartPos >spDesigned</>
  <Style />
  <TabOrder >0</>
  <Tag >0</>
  <Top >0</>
  <TopMost >1</>
  <VertAlign >alvTop</>
  <Visible >1</>
  <Width >398</>
  <WindowState >wsNormal</>
 </>
 <PropertiesAfter >
  <ClientHeight >530</>
  <ClientWidth >380</>
 </>
 <Events >
  <OnPosChanged />
  <OnMouse >fm</>
  <OnKey />
  <OnFocus />
  <OnCreate >Create</>
  <OnDestroy >Destroy</>
  <OnCloseQuery >Close</>
  <OnLanguage />
  <OnShow />
  <OnActivate />
 </>
 <Children >
  <_ TypeName = vTab >
   <Properties >
    <AutoLang >1</>
    <Bottom >0</>
    <Enabled >1</>
    <FixedWidth >0</>
    <Height >530</>
    <HelpTopic />
    <Hint />
    <HorzAlign >alhClient</>
    <ImageList >groups</>
    <Left >0</>
    <Name >Tab0</>
    <Right >0</>
    <Style />
    <TabOrder >0</>
    <TabStyle >tsNone</>
    <Tag >0</>
    <Top >0</>
    <VertAlign >alvTopBottom</>
    <Visible >1</>
    <Width >380</>
   </>
   <PropertiesAfter >
    <CurIndex >0</>
   </>
   <Events >
    <OnPosChanged />
    <OnMouse />
    <OnKey />
    <OnFocus />
    <OnChange />
   </>
   <Children >
    <_ TypeName = vTabItem >
     <Properties >
      <AutoLang >1</>
      <Bottom >0</>
      <Caption >history</>
      <Enabled >1</>
      <Height >501</>
      <HelpTopic />
      <Hint />
      <HorzAlign >alhLeft</>
      <ImageId >history</>
      <Left >4</>
      <Name >tiHistory</>
      <Right >0</>
      <Style />
      <TabOrder >0</>
      <Tag >0</>
      <Top >25</>
      <VertAlign >alvTop</>
      <Visible >1</>
      <Width >372</>
     </>
     <PropertiesAfter />
     <Events >
      <OnPosChanged />
      <OnMouse />
      <OnKey />
      <OnFocus />
     </>
     <Children />
    </>
   </>
  </>
  <_ TypeName = vToolBar >
   <Properties >
    <AutoLang >1</>
    <AutoSize >0</>
    <Bottom >5</>
    <Enabled >1</>
    <Height >25</>
    <HelpTopic />
    <Hint />
    <HorzAlign >alhLeft</>
    <ImageList >main</>
    <Left >0</>
    <Name >ToolBar0</>
    <Right >0</>
    <ShowCaption >tscNone</>
    <ShowDivider >0</>
    <Style />
    <TabOrder >1</>
    <Tag >0</>
    <Top >500</>
    <VertAlign >alvBottom</>
    <Vertical >0</>
    <Visible >0</>
    <Width >75</>
    <Wrapable >0</>
   </>
   <PropertiesAfter />
   <Events >
    <OnPosChanged />
    <OnMouse />
    <OnKey />
    <OnFocus />
   </>
   <Children >
    <_ TypeName = vToolBarItem >
     <Properties >
      <AutoLang >1</>
      <Caption >mainwin</>
      <Checked >0</>
      <Enabled >1</>
      <Hint />
      <ImageId >mclip</>
      <Index >0</>
      <Name >tbiMainWin</>
      <ShowCaption >0</>
      <Tag >0</>
      <TBIStyle >tbsAsCheckBox</>
      <Visible >1</>
     </>
     <PropertiesAfter />
     <Events >
      <OnClick >MainWin</>
     </>
     <Children />
    </>
    <_ TypeName = vToolBarItem >
     <Properties >
      <AutoLang >1</>
      <Caption >ToolBarItem0</>
      <Checked >0</>
      <Enabled >1</>
      <Hint />
      <Index >1</>
      <Name >ToolBarItem0</>
      <ShowCaption >0</>
      <Tag >0</>
      <TBIStyle >tbsButton</>
      <Visible >1</>
     </>
     <PropertiesAfter />
     <Events >
      <OnClick />
     </>
     <Children />
    </>
   </>
  </>
  <_ TypeName = vTray >
   <Properties >
    <AutoLang >1</>
    <Caption >progname</>
    <Image >main\mclip</>
    <Name >Tray0</>
    <RBtnPopupMenu >pmTray</>
    <Tag >0</>
    <Visible >0</>
   </>
   <PropertiesAfter />
   <Events >
    <OnMouse >Tray</>
   </>
   <Children />
  </>
  <_ TypeName = vPopupMenu >
   <Properties >
    <AutoLang >1</>
    <Name >pmTray</>
    <Tag >0</>
   </>
   <PropertiesAfter />
   <Events >
    <OnBeforeShow />
    <OnAfterShow />
   </>
   <Children >
    <_ TypeName = vMenuItem >
     <Properties >
      <AutoCheck >0</>
      <AutoLang >1</>
      <Caption >exit</>
      <Checked >0</>
      <Ellipsis >0</>
      <Enabled >1</>
      <Name >miExit</>
      <RadioCheck >0</>
      <Separator >0</>
      <Tag >0</>
      <Visible >1</>
     </>
     <PropertiesAfter />
     <Events >
      <OnClick >Exit</>
     </>
     <Children />
    </>
   </>
  </>
  <_ TypeName = vTimer >
   <Properties >
    <AutoLang >1</>
    <Enabled >0</>
    <Interval >1000</>
    <Name >timerRestore</>
    <Tag >0</>
   </>
   <PropertiesAfter />
   <Events >
    <OnTimer >Restore</>
   </>
   <Children />
  </>
  <_ TypeName = vPopupMenu >
   <Properties >
    <AutoLang >1</>
    <Name >pmBtns</>
    <Tag >0</>
   </>
   <PropertiesAfter />
   <Events >
    <OnBeforeShow >PopupBtns</>
    <OnAfterShow >PopupClose</>
   </>
   <Children >
    <_ TypeName = vMenuItem >
     <Properties >
      <AutoCheck >0</>
      <AutoLang >1</>
      <Caption >copytonotices</>
      <Checked >0</>
      <Ellipsis >0</>
      <Enabled >1</>
      <Name >miCopyToNotices</>
      <RadioCheck >0</>
      <Separator >0</>
      <Tag >0</>
      <Visible >0</>
     </>
     <PropertiesAfter />
     <Events >
      <OnClick />
     </>
     <Children />
    </>
    <_ TypeName = vMenuItem >
     <Properties >
      <AutoCheck >0</>
      <AutoLang >1</>
      <Caption >delete</>
      <Checked >0</>
      <Ellipsis >0</>
      <Enabled >1</>
      <Name >miDelete</>
      <RadioCheck >0</>
      <Separator >0</>
      <Tag >0</>
      <Visible >1</>
     </>
     <PropertiesAfter />
     <Events >
      <OnClick >DeleteItem</>
     </>
     <Children />
    </>
    <_ TypeName = vMenuItem >
     <Properties >
      <AutoCheck >0</>
      <AutoLang >1</>
      <Caption >edit</>
      <Checked >0</>
      <Ellipsis >0</>
      <Enabled >1</>
      <Name >MenuItem0</>
      <RadioCheck >0</>
      <Separator >0</>
      <Tag >0</>
      <Visible >0</>
     </>
     <PropertiesAfter />
     <Events >
      <OnClick >EditItem</>
     </>
     <Children />
    </>
   </>
  </>
 </>
</>
