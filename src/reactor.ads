package Reactor with SPARK_mode
is
   subtype ControlRods is Integer range 0..5;
   subtype WaterSupply is Integer range 0..100;
   subtype Temperature is Integer range 0..100;
   subtype TemperatureIncrease is Integer range 0..5;
   subtype Electricity is Integer range 0..1000;

   currentRods : ControlRods := ControlRods'Last;
   currentWaterSupply : WaterSupply := WaterSupply'Last;
   currentTemperature : Temperature := Temperature'First;
   currentTemperatureIncrease : TemperatureIncrease := TemperatureIncrease'First;
   currentElectricityProduced : Electricity := Electricity'First;

   function ReactorCheck return Boolean is
      (currentTemperature < 100 and currentWaterSupply > 0);

   procedure removeControlRod with
     Global => (In_Out => (currentRods, currentTemperatureIncrease), Proof_In => (currentTemperature, currentWaterSupply)),
     Pre => currentRods > 0 and currentTemperatureIncrease < 5 and ReactorCheck,
     Post => currentRods < currentRods+1 and ReactorCheck;

   procedure addControlRod with
     Global => (In_Out => (currentRods, currentTemperatureIncrease)),
     Pre => currentRods < 5 and currentTemperatureIncrease > 0,
     Post => currentRods > currentRods-1;

   procedure increaseTemperature (temp : out Integer) with
     Global => (In_Out => currentTemperature, Input => currentTemperatureIncrease),
     Pre => currentTemperature < 100,
     Post => currentTemperature >= currentTemperature-1;


end Reactor;
