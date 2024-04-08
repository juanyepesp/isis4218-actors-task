defmodule Chat do
  @exit_messge "-1"
  @starting_users 5

  def add_user({pid, user}) do
    send(:chatroom, {:add_user, {pid, user}})
  end

  def user_delete({pid, user}) do
    send(:chatroom, {:delete_user, {pid, user}})
  end

  def write_message(message) do
    send(:chatroom, {:write_message, message})
  end

  def chatroom_loop(all_msgs, pids, total_users) when length(pids) == 0 and total_users >= 0 do
    {:ok, all_msgs |> Enum.reverse(), "Chat ended"}
  end

  def chatroom_loop(all_msgs, pids, total_users) do
    receive do
      {:add_user, {pid, user}} ->
        msg = "--- #{user} joined the chat ---"
        send_message_to_all(msg, pids)
        chatroom_loop([msg | all_msgs], [pid | pids], total_users + 1)

      {:delete_user, {pid, user}} ->
        msg = "--- #{user} left the chat ---"
        updated_pids = List.delete(list, pid)
        send_message_to_all(msg, updated_pids)
        chatroom_loop([msg | all_msgs], updated_pids, total_users - 1)

      {:write_message, message} ->
        send_message_to_all(message, pids)
        chatroom_loop([message | all_msgs], pids, total_users)
    end
  end

  def send_message_to_all(message, pids) do
    Enum.each(pids, fn pid -> send(pid, {:write_message, {message}}) end)
  end

  def start_users do
    names = [
      "Nicolas",
      "Emma",
      "Liam",
      "Olivia",
      "Noah",
      "Ava",
      "William",
      "Sophia",
      "James",
      "Isabella"
    ]

    names
    |> Enum.take(@starting_users)
    |> Enum.each(fn name -> spawn(fn -> user_actions(name) end) end)
  end

  def user_actions(user) do
    pid = self()
    add_user({pid, user})
    send_messages(pid, user)
    user_delete({pid, user})
  end

  def send_messages(pid, user) do
    {user, message} = generate_random_message(user)

    unless message == "#{user}: #{@exit_message}" do
      write_message({user, message})
      Process.sleep(Enum.random(10..30))
      send_messages(pid, user)
    end
  end

  defp generate_random_message(user) do
    message =
      [
        "Hello, I'm here.",
        "This chatroom seems lively!",
        # "I'm here to chat and have fun!",
        # "I hope everyone's having a good day!",
        # "Let's make this chatroom even better!",
        # "I'm excited to be here!",
        # "This chatroom is awesome!",
        # "I'm having a great time!",
        # "I think I'll stay a while.",
        # "I'm new here, what's up?",
        # "I hope to make some friends here.",
        # "Looking forward to some interesting conversations!",
        # "Hey everyone, I'm here!",
        # "This chatroom looks cool!",
        # "I'm new here, what's up?",
        # "I hope to make some friends here.",
        # "Looking forward to some interesting conversations!",
        @exit_message
      ]
      |> Enum.random()

    {username, "#{username}: #{message}"}
  end

  def start_chatroom do
    Process.register(pid = spawn(fn -> chatroom_loop([], [], 0) end), :chatroom)
    start_users()
  end
end
