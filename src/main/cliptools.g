#!gentee.exe -s -p vis "%1"
define
{
	DESIGNING = 0
   COMP = 0   
}
include {   
   $"cliptools.gf"
   //$"cliptools.gi"
}
global {
   vfClipTools fClipTools
}

func run<main>
{
   App.Load()
   fClipTools.Owner = App   
   App.Run()
}
