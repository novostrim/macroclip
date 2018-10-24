#!gentee.exe -s -p vis "%1"
define
{
	DESIGNING = 0
   COMP = 0   
}
include {   
   $"clipman.gf"
   //$"clipman.gi"
}
global {
   vfClipMan fClipMan
}

func run<main>
{
   App.Load()
   fClipMan.Owner = App   
   App.Run()
}
