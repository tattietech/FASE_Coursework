package body Reactor with SPARK_mode
is
   procedure removeControlRod is
   begin
      currentRods := currentRods-1;
      currentReactorPower := currentReactorPower+1;
   end removeControlRod;

   procedure addControlRod is
   begin
      currentRods := currentRods+1;
      currentReactorPower := currentReactorPower-1;
   end addControlRod;

   procedure increaseTemperature (temp : out Integer) is
      begin
      temp := currentTemperature + currentReactorPower;
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
         temp := currentTemperature - currentWaterSupply/10;
         if temp < 0 then
            currentTemperature := 0;
         else
            currentTemperature := temp;
         end if;
      else
         currentTemperature := currentTemperature-1;
      end if;

   end decreaseTemperature;

end Reactor;
