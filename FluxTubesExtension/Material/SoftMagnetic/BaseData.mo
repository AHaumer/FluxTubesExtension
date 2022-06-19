within FluxTubesExtension.Material.SoftMagnetic;
record BaseData "Replace: Coefficients for approximation of soft magnetic materials acc. to Roschke"

  extends FluxTubesExtension.Material.BaseSoftMagneticData(
  label="SoftMagnetic",
  final approximation=FluxTubesExtension.Types.Approximation.Roschke,
  final N=1,
  final Hk={0},
  final Bk={0});
  annotation (defaultComponentPrefixes="parameter",
    Documentation(info="<html>
<p>
The parameters needed for <a href=\"modelica://FluxTubesExtension.UsersGuide.ApproximationSoftMagnetic\">approximation of the magnetisation characteristics</a> of included soft magnetic materials are declared in this record.
</p>
</html>"), Icon(graphics={Text(
          extent={{-100,-10},{100,-40}},
          textColor={0,0,255},
          textString="%label")}));
end BaseData;
