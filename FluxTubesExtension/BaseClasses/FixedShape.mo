within FluxTubesExtension.BaseClasses;
partial model FixedShape
  "Base class for flux tubes with fixed shape during simulation; linear or non-linear material characteristics"

  extends Modelica.Magnetic.FluxTubes.Interfaces.TwoPort;

  parameter Boolean nonLinearPermeability=true
    "= true, if non-linear rel. permeability is used, otherwise constant rel. permeability"
    annotation (Dialog(group="Material"), Evaluate=true);
  parameter SI.RelativePermeability mu_rConst=1
    "Constant relative permeability; used if nonLinearPermeability = false"
    annotation (Dialog(group="Material", enable=not nonLinearPermeability));
  parameter FluxTubesExtension.Material.BaseSoftMagneticData material=
    FluxTubesExtension.Material.SoftMagnetic.BaseData()
    "Ferromagnetic material characteristics; used if nonLinearPermeability = true"
    annotation (choicesAllMatching=true, Dialog(group="Material", enable=nonLinearPermeability));

  SI.Reluctance R_m "Magnetic reluctance";
  SI.Permeance G_m "Magnetic permeance";
  SI.MagneticFluxDensity B "Magnetic flux density";
  SI.CrossSection A "Cross-sectional area penetrated by magnetic flux";
  SI.Length l_m "Length of field line";
  SI.MagneticFieldStrength H "Magnetic field strength";

  SI.RelativePermeability mu_r "Relative magnetic permeability";

protected
  Real B_N=abs(B)/material.B_myMax "Absolute value of normalized B";

equation
  if not nonLinearPermeability then
    mu_r = mu_rConst;
    H = B/(mu_0*mu_r);
  else
    if material.approximation==FluxTubesExtension.Types.Approximation.Roschke then
      mu_r = 1 + (material.mu_i - 1 + material.c_a*B_N)/(1 + material.c_b*B_N + B_N^material.n);
      H = B/(mu_0*mu_r);
    elseif material.approximation==FluxTubesExtension.Types.Approximation.Macfadyen then
      B = FluxTubesExtension.Material.SimpleSoftMagnetic.BH_Approx(material, H);
      mu_r = FluxTubesExtension.Material.SimpleSoftMagnetic.mu_rApprox(material, H);
    else//material.approximation==FluxTubesExtension.Types.Approximation.PiecewiseLinear
      B = FluxTubesExtension.Material.PiecewiseLinearSoftMagnetic.BH_Approx(material, H);
      mu_r = FluxTubesExtension.Material.PiecewiseLinearSoftMagnetic.mu_rApprox(material, H);
    end if;
  end if;
  G_m = mu_0*mu_r*A/l_m;
  R_m = 1/G_m;
  B = Phi/A;
//V_m = R_m*Phi;
  H = V_m/l_m;

  annotation (Documentation(info="<html>
<p>
Please refer to the description of  the sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.FixedShape\">Shapes.FixedShape</a> for utilisation of this partial model.
</p>
</html>"));
end FixedShape;
