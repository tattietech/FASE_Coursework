with Ada.Text_IO; use Ada.Text_IO;
package body Reactor with SPARK_mode
is
   procedure startReactor is
   begin
      if currentRods = ControlRods'Last then
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
      currentRods := currentRods-1;
      if currentPowerStatus = On then
         if currentTemperatureIncrease < TemperatureIncrease'Last then
            currentTemperatureIncrease := currentTemperatureIncrease+1;
         end if;

         if currentReactorPower < ReactorPower'Last-2 then
            currentReactorPower := currentReactorPower+2;
         else
            currentReactorPower := ReactorPower'Last;
         end if;
         if currentRods > ControlRods'First then
            currentMaxElectricity := Electricity'Last / currentRods;
         else
            currentMaxElectricity := Electricity'Last;
         end if;
      else
         currentMaxElectricity := Electricity'First;
      end if;
   end removeControlRod;

   procedure addControlRod is
   begin
      currentRods := currentRods+1;

     if currentTemperatureIncrease > Temperature'First then
        currentTemperatureIncrease := currentTemperatureIncrease-1;
     end if;

     if currentReactorPower > ReactorPower'First then
        currentReactorPower := currentReactorPower-1;
      end if;

      if ReactorOn then
         currentMaxElectricity := Electricity'Last / currentRods;
      else
         currentMaxElectricity := Electricity'First;
      end if;
   end addControlRod;

   procedure increaseTemperature (temp : out Integer) is
   begin
      temp := currentTemperature + currentTemperatureIncrease;
      if ReactorOn then
         if temp > Temperature'Last then
            currentTemperature := Temperature'Last;
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
         if temp < Temperature'First then
            currentTemperature := Temperature'First;
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
      currentWaterSupply := WaterSupply'Last;
   end fillWaterSupply;


end Reactor;
