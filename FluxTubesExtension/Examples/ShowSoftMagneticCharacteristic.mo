within FluxTubesExtension.Examples;
model ShowSoftMagneticCharacteristic
  "Show characteristic of SoftMagnetic material"
  extends Modelica.Icons.Example;
  SI.MagneticFieldStrength H=-25E3 + 50E3*time
    "Magnetic field strength";
  SI.RelativePermeability mu_r(start=1)=
     1 + (material.mu_i - 1 + material.c_a*abs(B)/material.B_myMax)/(1 + material.c_b*abs(B)/material.B_myMax + (abs(B)/material.B_myMax)^material.n)
    "Relative permeability of material";
  SI.MagneticFluxDensity B=mu_0*mu_r*H
    "Magnetic flux density of material";
  SI.MagneticFluxDensity B_simple=Material.SimpleSoftMagnetic.BH_Approx(simpleMaterial, H)
    "Magnetic flux density of simple material";
  SI.RelativePermeability mu_r_ssimple=Material.SimpleSoftMagnetic.mu_rApprox(simpleMaterial,H)
    "Relative permeability of simple material ";
  SI.RelativePermeability mu_rd_simple=Material.SimpleSoftMagnetic.mu_rdApprox(simpleMaterial,H)
    "Relative differential permeability of simple material ";
  SI.MagneticFluxDensity B_piecewiseLinear=Material.PiecewiseLinearSoftMagnetic.BH_Approx(piecewiseLinearMaterial, H)
    "Magnetic flux density of piecewise linear interpolated material";
  SI.RelativePermeability mu_r_piecewiseLinear=Material.PiecewiseLinearSoftMagnetic.mu_rApprox(piecewiseLinearMaterial, H)
    "Relative permeability of piecewise linear interpolated material ";
  SI.RelativePermeability mu_rd_piecewiseLinear=Material.PiecewiseLinearSoftMagnetic.mu_rdApprox(piecewiseLinearMaterial, H)
    "Relative differential permeability of piecewise linear interpolated material ";
  parameter Material.SoftMagnetic.ElectricSheet.M350_50A material
    annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
  parameter Material.SimpleSoftMagnetic.ESheetI simpleMaterial
    annotation (Placement(transformation(extent={{-10,0},{10,20}})));
  parameter Material.PiecewiseLinearSoftMagnetic.ESheetI piecewiseLinearMaterial
    annotation (Placement(transformation(extent={{40,0},{60,20}})));
  annotation (experiment(
      Interval=0.0001,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"), Documentation(info="<html>
<p>
Any of the <a href=\"modelica://Modelica.Magnetic.FluxTubes.Material.SoftMagnetic\">softmagnetic materials</a> can be instantiated as material. 
Flux density is varied, and one could plot flux density B and relative permeability mu_r versus magnetic field strength H.
</p>
</html>"));
end ShowSoftMagneticCharacteristic;
