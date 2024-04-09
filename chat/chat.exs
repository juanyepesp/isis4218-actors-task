defmodule Chat do
  @exit_message "-1"
  @starting_users 5

  def add_user({pid, user}) do
    chatroom_pid = Process.whereis(:chatroom)
    send(chatroom_pid, {:add_user, {pid, user}})
  end

  def user_delete({pid, user}) do
    chatroom_pid = Process.whereis(:chatroom)
    send(chatroom_pid, {:delete_user, {pid, user}})
  end

  def write_message(message) do
    chatroom_pid = Process.whereis(:chatroom)
    send(chatroom_pid, {:write_message, message})
  end

  def chatroom_loop(all_msgs, pids, users_left) when length(pids) == 0 and users_left == 0 do
    all_msgs |> Enum.reverse()
  end

  def chatroom_loop(all_msgs, pids, users_left) do
    receive do
      {:add_user, {pid, user}} ->
        msg = "--- #{user} joined the chat ---"
        send_message_to_all(pids, msg)
        chatroom_loop([msg | all_msgs], [pid | pids], users_left)

      {:delete_user, {pid, user}} ->
        msg = "--- #{user} left the chat ---"
        updated_pids = List.delete(pids, pid)
        send_message_to_all(updated_pids, msg)
        chatroom_loop([msg | all_msgs], updated_pids, users_left - 1)

      {:write_message, message} ->
        send_message_to_all(pids, message)
        chatroom_loop([message | all_msgs], pids, users_left)

      _ ->
        chatroom_loop(all_msgs, pids, users_left)
        # after
        #   1000 ->
        #     IO.inspect(length(pids))
        #     IO.inspect(total_users)
        #     chatroom_loop(all_msgs, pids, total_users)
    end
  end

  def send_message_to_all(pids, message) do
    Enum.each(pids, fn pid -> send(pid, {:message, message}) end)
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
    |> Enum.map(fn name -> Task.async(fn -> user_actions(name) end) end)
    |> Task.await_many()
  end

  def user_actions(user) do
    pid = self()
    add_user({pid, user})
    send_messages(pid, user)
    user_delete({pid, user})
    {user, actor_messages([])}
  end

  def actor_messages(messages) do
    receive do
      {:message, message} ->
        actor_messages([message | messages])
    after
      1000 ->
        messages |> Enum.reverse()
    end
  end

  def send_messages(pid, user) do
    {user, message} = generate_random_message(user)

    unless message == "#{user}: #{@exit_message}" do
      write_message(message)
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

    {user, "#{user}: #{message}"}
  end

  def show_user_logs(user, user_logs) do
    IO.puts("\n")
    IO.puts("-------------------------")
    IO.puts("Messages as seen by user: #{user}")
    IO.inspect(user_logs)
  end

  def show_chat_log(chat_log) do
    IO.puts("\n")
    IO.puts("-------------------------")
    IO.puts("All messages")
    IO.inspect(chat_log)
  end

  def start do
    chat_task = Task.async(fn -> chatroom_loop([], [], @starting_users) end)
    chat_pid = Map.get(chat_task, :pid)
    Process.register(chat_pid, :chatroom)
    users_logs = start_users()
    Enum.each(users_logs, fn {user, user_log} -> show_user_logs(user, user_log) end)
    chat_log = Task.await(chat_task, :infinity)
    show_chat_log(chat_log)
    :ok
  end
end
