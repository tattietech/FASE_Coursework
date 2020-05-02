package Reactor with SPARK_mode
is
   subtype ControlRods is Integer range 0..5;
   subtype WaterSupply is Integer range 0..100;
   subtype Temperature is Integer range 0..100;
   subtype TemperatureIncrease is Integer range 0..5;
   subtype ReactorPower is Integer range 0..10;
   subtype Electricity is Integer range 0..100;

   currentRods : ControlRods := ControlRods'Last;
   currentWaterSupply : WaterSupply := WaterSupply'Last;
   currentTemperature : Temperature := Temperature'First;
   currentTemperatureIncrease : TemperatureIncrease := 1;
   currentReactorPower : ReactorPower := 1;
   currentElectricityProduced : Electricity := Electricity'First;
   InputConst : Integer := 0;

   function ReactorCheck return Boolean is
      (currentTemperature < 100 and currentWaterSupply > 0);

   procedure removeControlRod with
     Global => (In_Out => (currentRods, currentTemperatureIncrease, currentReactorPower), Proof_In => (currentWaterSupply,currentTemperature)),
     Pre => currentRods > 0 and currentTemperatureIncrease < 5 and currentReactorPower < 10 and ReactorCheck,
     Post => currentRods < currentRods+1 and ReactorCheck;

   procedure addControlRod with
     Global => (In_Out => (currentRods, currentTemperatureIncrease, currentReactorPower)),
     Pre => currentRods < 5 and currentTemperatureIncrease > 0 and currentReactorPower > 0,
     Post => currentRods > currentRods-1;

   procedure increaseTemperature (temp : out Integer) with
     Global => (In_Out => currentTemperature, Input => currentTemperatureIncrease),
     Pre => currentTemperature < 100,
     Post => currentTemperature > currentTemperature-1;

   procedure decreaseTemperature (temp : out Integer) with
     Global => (In_Out => currentTemperature, Input => currentWaterSupply),
     Pre => currentTemperature > 0,
     Post => currentTemperature < currentTemperature+1;

   procedure increaseElectricity (elec : out Integer) with
     Global => (In_Out => currentElectricityProduced, Input => currentReactorPower),
     Pre => currentElectricityProduced < 1000,
     Post => currentElectricityProduced > currentElectricityProduced-1;

   procedure decreaseWaterSupply with
     Global => (In_Out => currentWaterSupply),
     Pre => currentWaterSupply > 0,
     Post => currentWaterSupply < currentWaterSupply+1;

   procedure fillWaterSupply with
     Global => (Output => currentWaterSupply);


end Reactor;
