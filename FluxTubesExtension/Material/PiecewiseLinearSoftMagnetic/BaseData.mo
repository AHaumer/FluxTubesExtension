within FluxTubesExtension.Material.PiecewiseLinearSoftMagnetic;
record BaseData "Coefficients for approximation of soft magnetic materials with piecewise linear interpolation"

  extends FluxTubesExtension.Material.BaseSoftMagneticData(
  label="PiecewiseLinear SoftMagnetic",
  final approximation=FluxTubesExtension.Types.Approximation.PiecewiseLinear,
    final mu_i= Bk[1]/(mu_0*Hk[1]),
    final B_myMax=1,
    final c_a=1,
    final c_b=1,
    final n=1);
  annotation (defaultComponentPrefixes="parameter",
    Documentation(info="<html>
<p>
The parameters needed for <a href=\"modelica://FluxTubesExtension.UsersGuide.ApproximationSoftMagnetic\">approximation of the magnetisation characteristics</a> of included soft magnetic materials are declared in this record.
</p>
<p>
Note: [Hk, Bk] = [0, 0] is added automatically.
</p>
</html>"), Icon(graphics={Text(
          extent={{-100,-10},{100,-40}},
          textColor={0,0,255},
          textString="%label")}));
end BaseData;
