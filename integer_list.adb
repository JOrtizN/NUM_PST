with Ada.Text_IO;
with Ada.Strings.Unbounded;


package body Integer_List is

	package ASU renames Ada.Strings.Unbounded;

	procedure Add_Number(Integer_list: in out Integer_List_type;
			     Number: in Integer; Winner: out Boolean) is
		Ptr_Aux: Integer_List_Type;
	begin
		if Number = 7 then
			raise Seven_Not_Allowed;
		end if;

		Ptr_Aux := Integer_List;
		if Integer_List = null then
			Integer_List := new cell'(Number, null);
			Winner := Number = 5;	-- es una comparacion que cuando se cumple hace que winner = True.
			return;
 		--else
		--	Ptr_Aux := new Cell'(Number, integer_list);
		--	Integer_List := Ptr_aux;
		end if;

		-- Añadir al final:
		while Ptr_Aux.Next /= null loop
			Ptr_Aux := Ptr_Aux.Next;
		end loop;
		Ptr_Aux.Next := new cell'(Number, null);
		--Winner := Number = 5;	-- no lo entiendo ahora
	end Add_Number;

	procedure Suma_Numbers (List: Integer_List_Type) is
	      P_Number: Integer_List_Type := List;
	      Suma: Integer:= 0;
	   begin
	      while P_Number /= null loop
		Suma:= Suma + P_Number.Number;
		 Ada.Text_IO.Put(Integer'Image(P_Number.Number));
		 P_Number := P_Number.Next;
		 if P_Number /= null then
		   Ada.Text_IO.Put(" +");
		 end if;
	      end loop;
	      Ada.Text_IO.Put(" = " & Integer'Image(Suma) );
	   end Suma_Numbers;


	procedure Print_List ( Integer_list: in Integer_List_Type) is

	Ptr_Aux2: Integer_List_Type;
	begin
		Ptr_Aux2 := Integer_List;
		while Ptr_Aux2 /= null loop
			Ada.Text_IO.Put_Line("Number: " & Integer'Image(Ptr_Aux2.Number));
		--	Ada.Text_IO.Put_Line(Integer'Image(Ptr_Aux2.Number));
			Ptr_Aux2 := Ptr_Aux2.Next;
		end loop;

	end Print_List;

	procedure Save_File (Integer_list: in Integer_List_Type) is
		File: Ada.Text_IO.File_Type;
		Ptr_Aux: Integer_List_Type;
	begin
		Ada.Text_IO.Put_Line("CREAR");
		Ada.Text_IO.Create(File, Ada.Text_IO.Out_File, "output.txt");
		Ptr_Aux := Integer_list;
		while Ptr_Aux /= null loop
			Ada.Text_IO.Put_Line(File, "Number: " & Integer'Image(Ptr_Aux.Number));
			Ptr_Aux := Ptr_Aux.Next;
		end loop;

	end Save_File;

end Integer_List;
