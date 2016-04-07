defmodule Chat.RoomChannel do
  use Phoenix.Channel

  def join("rooms:lobby", _message, socket) do
    {:ok, socket}
  end

  def join("rooms:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_msg", msg, socket) do
    broadcast! socket, "new_msg", %{x: msg["x"], y: msg["y"]}
    {:noreply, socket}
  end

 def handle_out("new_msg", payload, socket) do
   push socket, "new_msg", payload
   {:noreply, socket}
 end
end
