package body Reactor with SPARK_mode
is
   procedure removeControlRod is
   begin
      currentRods := currentRods-1;
      currentTemperatureIncrease := currentTemperatureIncrease+1;
   end removeControlRod;

   procedure addControlRod is
   begin
      currentRods := currentRods+1;
      currentTemperatureIncrease := currentTemperatureIncrease-1;
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
end Reactor;
