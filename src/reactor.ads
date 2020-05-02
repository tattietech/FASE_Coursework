package Reactor with SPARK_mode
is
   type ControlRods is range 0..5;
   type WaterSupply is range 0..100;
   type Temperature is range 0..100;
   type Electricity is range 0..1000;

   currentRods : ControlRods := ControlRods'Last;
   currentWaterSupply : WaterSupply := WaterSupply'Last;
   currentTemperature : Temperature := Temperature'First;
   currentElectricityProduced : Electricity := Electricity'First;

   function ReactorCheck return Boolean is
      (currentTemperature < 90 and currentWaterSupply > 10);

   procedure RemoveControlRod with
     Global => (In_Out => currentRods, Proof_In => (currentTemperature, currentWaterSupply)),
     Pre => currentRods > 0 and ReactorCheck,
     Post => currentRods < currentRods+1 and ReactorCheck;

   procedure AddControlRod with
     Global => (In_Out => currentRods),
     Pre => currentRods < 5,
     Post => currentRods > currentRods-1;


end Reactor;
