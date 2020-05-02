package body Reactor with SPARK_mode
is
   procedure removeControlRod is
   begin
      currentRods := currentRods-1;
      currentTemperatureIncrease := currentTemperatureIncrease+1;
      if currentReactorPower < 9 then
         currentReactorPower := currentReactorPower+2;
      else
         currentReactorPower := 10;
      end if;
   end removeControlRod;

   procedure addControlRod is
   begin
      currentRods := currentRods+1;
      currentTemperatureIncrease := currentTemperatureIncrease-1;
      currentReactorPower := currentReactorPower-1;
   end addControlRod;

   procedure increaseTemperature (temp : out Integer) is
      begin
      temp := currentTemperature + currentTemperatureIncrease;
      if temp > 100 then
         currentTemperature := 100;
      else
         currentTemperature := temp;
      end if;
   end increaseTemperature;

   procedure decreaseTemperature (temp : out Integer) is
   begin
      temp := 0;
      if currentWaterSupply >= 10 then
         temp := currentTemperature - currentWaterSupply/15;
         if temp < 0 then
            currentTemperature := 0;
         else
            currentTemperature := temp;
         end if;
      else
         currentTemperature := currentTemperature-1;
      end if;
   end decreaseTemperature;

   procedure increaseElectricity (elec : out Integer) is
      begin
      elec := currentElectricityProduced + currentReactorPower;
      if elec > 100 then
         currentElectricityProduced := 100;
      else
         currentElectricityProduced := elec;
      end if;
   end increaseElectricity;

   procedure decreaseWaterSupply is
   begin
      currentWaterSupply := currentWaterSupply -1;
   end decreaseWaterSupply;

   procedure fillWaterSupply is
   begin
      currentWaterSupply := 100;
   end fillWaterSupply;


end Reactor;
