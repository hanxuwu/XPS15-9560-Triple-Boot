//
// SSDT-XOSI.dsl
//
// Dell XPS 15 9560
//
// This SSDT reports the system is Windows 2015 (Windows 10).
// Dell only really expects Windows 10 to be run on this, 
// so reporting to be Windows 10 enables most hardware.
//
// Used with "Rename _OSI to XOSI" in Clover's config.plist.
//
// Credit to RehabMan:
// https://github.com/RehabMan/OS-X-Clover-Laptop-Config
//

DefinitionBlock("", "SSDT", 2, "hack", "XOSI", 0)
{
    // All _OSI calls in DSDT are routed to XOSI...
    // XOSI simulates "Windows 2009" (which is Windows 7)
    // Note: According to ACPI spec, _OSI("Windows") must also return true
    //  Also, it should return true for all previous versions of Windows.
    Method(XOSI, 1)
    {
        // simulation targets
        // source: (google 'Microsoft Windows _OSI')
        //  http://download.microsoft.com/download/7/E/7/7E7662CF-CBEA-470B-A97E-CE7CE0D98DC2/WinACPI_OSI.docx
        Local0 = Package()
        {
            "Windows",              // generic Windows query
            "Windows 2001",         // Windows XP
            "Windows 2001 SP2",     // Windows XP SP2
            //"Windows 2001.1",     // Windows Server 2003
            //"Windows 2001.1 SP1", // Windows Server 2003 SP1
            "Windows 2006",         // Windows Vista
            "Windows 2006 SP1",     // Windows Vista SP1
            "Windows 2006.1",       // Windows Server 2008
            "Windows 2009",         // Windows 7/Windows Server 2008 R2
            "Windows 2012",         // Windows 8/Windows Server 2012
            "Windows 2013",       // Windows 8.1/Windows Server 2012 R2
            "Windows 2015",       // Windows 10/Windows Server TP
        }
        Return (Ones != Match(Local0, MEQ, Arg0, MTR, 0, 0))
    }
}
//EOF
