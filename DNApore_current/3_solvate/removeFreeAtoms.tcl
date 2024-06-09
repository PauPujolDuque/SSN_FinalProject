# This script will remove atoms from psf and pdf files.
# Use with: vmd -dispdev text -e removeFreeAtoms.tcl
# jcomer2@uiuc.edu

set selText "numbonds == 0"

#Input:
set psf ../1_build/pore.psf
set pdb ../1_build/pore.pdb
#Output:
set psfFinal pore.psf
set pdbFinal pore.pdb 

# Obtain the {segid resid name} for the selection.
mol load psf $psf pdb $pdb
set sel [atomselect top $selText]
set atomList [$sel get {segname resid name}]
puts "\nNote: [$sel num] atoms will be deleted."
$sel delete

package require psfgen 1.3
resetpsf

readpsf $psf
coordpdb $pdb

# Delete the selection.
foreach atom $atomList {
    delatom [lindex $atom 0] [lindex $atom 1] [lindex $atom 2]
}

writepsf $psfFinal
writepdb $pdbFinal
mol delete top
