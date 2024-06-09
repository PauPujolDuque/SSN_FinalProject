# Add harmonic constraints to silicon nitride.
# to use: vmd -dispdev text -e constrainSilicon.tcl
# jcomer2@uiuc.edu

# Parameters:
# Spring constant in kcal/(mol A^2)
set betaList {5.0}
set selText "not ions"

# Input:
set psf pore_all.psf
set pdb pore_all.pdb
# Output:
set restFilePrefix langevinDamping

mol load psf $psf pdb $pdb
set selAll [atomselect top all]

# Set the spring constants to zero for all atoms.
$selAll set occupancy 0.0
$selAll set beta 0.0

# Select the silicon nitride.
set selSiN [atomselect top $selText]

foreach beta $betaList {
	# Set the spring constant for SiN to this beta value.
	$selSiN set beta $beta
	# Write the constraint file.
	$selAll writepdb ${restFilePrefix}${beta}.pdb
}
$selSiN delete
$selAll delete
mol delete top
