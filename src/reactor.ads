package Reactor with SPARK_mode
is
   subtype ControlRods is Integer range 0..5;
   subtype WaterSupply is Integer range 0..100;
   subtype Temperature is Integer range 0..100;
   subtype ReactorPower is Integer range 0..5;
   subtype Electricity is Integer range 0..1000;

   currentRods : ControlRods := ControlRods'Last;
   currentWaterSupply : WaterSupply := WaterSupply'Last;
   currentTemperature : Temperature := Temperature'First;
   currentReactorPower : ReactorPower := ReactorPower'First;
   currentElectricityProduced : Electricity := Electricity'First;

   function ReactorCheck return Boolean is
      (currentTemperature < 100 and currentWaterSupply > 0);

   procedure removeControlRod with
     Global => (In_Out => (currentRods, currentReactorPower), Proof_In => (currentTemperature, currentWaterSupply)),
     Pre => currentRods > 0 and currentReactorPower < 5 and ReactorCheck,
     Post => currentRods < currentRods+1 and ReactorCheck;

   procedure addControlRod with
     Global => (In_Out => (currentRods, currentReactorPower)),
     Pre => currentRods < 5 and currentReactorPower > 0,
     Post => currentRods > currentRods-1;

   procedure increaseTemperature (temp : out Integer) with
     Global => (In_Out => currentTemperature, Input => currentReactorPower),
     Pre => currentTemperature < 100,
     Post => currentTemperature > currentTemperature-1;

   procedure decreaseTemperature (temp : out Integer) with
     Global => (In_Out => currentTemperature, Input => currentWaterSupply),
     Pre => currentTemperature > 0,
     Post => currentTemperature < currentTemperature+1;


end Reactor;
