within FluxTubesExtension.Material;
record BaseSoftMagneticData
  "Replace: Coefficients for approximation of soft magnetic materials"

  extends Modelica.Icons.Record;
  parameter String label="SoftMagnetic" "Name of material";
  parameter FluxTubesExtension.Types.Approximation approximation
    "Approximation of soft magnetic chracateristics";
//Roschke
  parameter SI.RelativePermeability mu_i=1 "Initial relative permeability at B=0";
  parameter SI.MagneticFluxDensity B_myMax=1 "Flux density at maximum relative permeability";
  parameter Real c_a=1 "Coefficient of approximation function";
  parameter Real c_b=1 "Coefficient of approximation function";
  parameter Real n=1 "Exponent of approximation function";
//Macfadyen
  parameter Integer N=1 "Count of nodes";
  parameter SI.MagneticFieldStrength Hk[N]={0} "Field strength coefficients";
  parameter SI.MagneticFluxDensity Bk[N]={0} "Flux density coefficients";
  annotation (defaultComponentPrefixes="parameter",
    Documentation(info="<html>
<p>
The parameters needed for <a href=\"modelica://FluxTubesExtension.UsersGuide.ApproximationSoftMagnetic\">approximation of the magnetisation characteristics</a> of included soft magnetic materials are declared in this record.
</p>
</html>"), Icon(graphics={Text(
          extent={{-100,-10},{100,-40}},
          textColor={0,0,255},
          textString="%label")}));
end BaseSoftMagneticData;
