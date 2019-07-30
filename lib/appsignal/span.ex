defmodule Appsignal.Span do
  alias Appsignal.Nif

  def create(name) do
    {:ok, reference} = Nif.appsignal_create_root_span(name)
    # TODO: Store the span reference in the process dictionary.
    reference
  end

  def create(trace_id, parent_id, name) do
    {:ok, reference} = Nif.appsignal_create_child_span(trace_id, parent_id, name)
    # TODO: Store the span reference in the process dictionary.
    reference
  end

  def set_attribute(reference, key, value) when is_binary(value) do
    :ok = Nif.appsignal_set_attribute_string(key, value)
    reference
  end

  def close(reference) do
    :ok = Nif.appsignal_close_span(key, value)
    reference
  end
end
