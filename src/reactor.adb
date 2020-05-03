with Ada.Text_IO; use Ada.Text_IO;
package body Reactor with SPARK_mode
is
   procedure startReactor is
   begin
      if currentRods = 5 then
         currentPowerStatus := On;
         currentMaxElectricity := Electricity'Last / currentRods;
      end if;
   end startReactor;

   procedure stopReactor is
   begin
      currentPowerStatus := Off;
      currentMaxElectricity := Electricity'First;
   end stopReactor;

   procedure removeControlRod is
   begin
      if ReactorOn then
         currentRods := currentRods-1;
         currentTemperatureIncrease := currentTemperatureIncrease+1;
         if currentReactorPower < 9 then
            currentReactorPower := currentReactorPower+2;
         else
            currentReactorPower := 10;
         end if;
         if currentRods > 0 then
            currentMaxElectricity := Electricity'Last / currentRods;
         else
            currentMaxElectricity := Electricity'Last;
         end if;
      end if;
   end removeControlRod;

   procedure addControlRod is
   begin
      currentRods := currentRods+1;
      currentTemperatureIncrease := currentTemperatureIncrease-1;
      currentReactorPower := currentReactorPower-1;
      if ReactorOn then
         currentMaxElectricity := Electricity'Last / currentRods;
      end if;
   end addControlRod;

   procedure increaseTemperature (temp : out Integer) is
   begin
      temp := currentTemperature + currentTemperatureIncrease;
      if ReactorOn then
         if temp > 100 then
            currentTemperature := 100;
         else
            currentTemperature := temp;
         end if;
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
     if elec >= currentMaxElectricity then
        currentElectricityProduced := currentMaxElectricity;
     elsif elec > 200 then
        currentElectricityProduced := 200;
     else
        currentElectricityProduced := elec;
     end if;
   end increaseElectricity;

   procedure decreaseWaterSupply is
   begin
      if ReactorOn then
         currentWaterSupply := currentWaterSupply -1;
      end if;
   end decreaseWaterSupply;

   procedure fillWaterSupply is
   begin
      currentWaterSupply := 100;
   end fillWaterSupply;


end Reactor;
