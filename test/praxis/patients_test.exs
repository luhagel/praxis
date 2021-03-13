defmodule Praxis.PatientsTest do
  use Praxis.DataCase

  alias Praxis.Patients

  describe "patients" do
    alias Praxis.Patients.Patient

    @valid_attrs %{
      avatar_url: "some avatar_url",
      date_of_birth: ~D[2010-04-17],
      first_name: "some first_name",
      last_name: "some last_name"
    }
    @update_attrs %{
      avatar_url: "some updated avatar_url",
      date_of_birth: ~D[2011-05-18],
      first_name: "some updated first_name",
      last_name: "some updated last_name"
    }
    @invalid_attrs %{avatar_url: nil, date_of_birth: nil, first_name: nil, last_name: nil}

    def patient_fixture(attrs \\ %{}) do
      {:ok, patient} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Patients.create_patient()

      patient
    end

    test "list_patients/0 returns all patients" do
      patient = patient_fixture()
      assert Patients.list_patients() == [patient]
    end

    test "get_patient!/1 returns the patient with given id" do
      patient = patient_fixture()
      assert Patients.get_patient!(patient.id) == patient
    end

    test "create_patient/1 with valid data creates a patient" do
      assert {:ok, %Patient{} = patient} = Patients.create_patient(@valid_attrs)
      assert patient.avatar_url == "some avatar_url"
      assert patient.date_of_birth == ~D[2010-04-17]
      assert patient.first_name == "some first_name"
      assert patient.last_name == "some last_name"
    end

    test "create_patient/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Patients.create_patient(@invalid_attrs)
    end

    test "update_patient/2 with valid data updates the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{} = patient} = Patients.update_patient(patient, @update_attrs)
      assert patient.avatar_url == "some updated avatar_url"
      assert patient.date_of_birth == ~D[2011-05-18]
      assert patient.first_name == "some updated first_name"
      assert patient.last_name == "some updated last_name"
    end

    test "update_patient/2 with invalid data returns error changeset" do
      patient = patient_fixture()
      assert {:error, %Ecto.Changeset{}} = Patients.update_patient(patient, @invalid_attrs)
      assert patient == Patients.get_patient!(patient.id)
    end

    test "delete_patient/1 deletes the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{}} = Patients.delete_patient(patient)
      assert_raise Ecto.NoResultsError, fn -> Patients.get_patient!(patient.id) end
    end

    test "change_patient/1 returns a patient changeset" do
      patient = patient_fixture()
      assert %Ecto.Changeset{} = Patients.change_patient(patient)
    end
  end
end
