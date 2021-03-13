defmodule PraxisWeb.LiveHelpers do
  import Phoenix.LiveView.Helpers

  @doc """
  Renders a component inside the `PraxisWeb.ModalComponent` component.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <%= live_modal @socket, PraxisWeb.PatientLive.FormComponent,
        id: @patient.id || :new,
        action: @live_action,
        patient: @patient,
        return_to: Routes.patient_index_path(@socket, :index) %>
  """
  def live_modal(_socket, component, opts) do
    path = Keyword.fetch!(opts, :return_to)
    title = Keyword.fetch!(opts, :title)
    modal_opts = [id: :modal, return_to: path, title: title, component: component, opts: opts]
    live_component(socket, PraxisWeb.ModalComponent, modal_opts)
  end
end
