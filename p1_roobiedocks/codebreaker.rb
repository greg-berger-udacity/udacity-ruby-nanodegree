# Roobiedocks & Reflect
# ~~~~~~~~~~~~~~~~~~~~~

# You wake up, only to find yourself in an unfamiliar land...

# You wander in the wilderness and come across a door.
# All it says is "Welcome to Roobiedocks".
# You try opening it, but it is locked.

# Below the lock is a code along with a series of instructions.
# Follow these instructions, it looks like that will unlock the door.

code = "M.E?CIQN E?RS, D?NA EQC,IN S,,I Z?TQAM,"

# ---------------------------------------------------------------
# | 0. Remove the first character in the code.                  |
# | 1. Insert the string "A EW? O" at the code's 11th position. |
# | 2. Remove all instances of the characters 'Q', '?', and ','.|
# | 3. STOP SHOUTING. Make the entire code lowercase, for now.  |
# | 4. Reverse the order of the characters in the code.         |
# | 5. Capitalize the first letter of the code.                 |
# | 6. `puts` the code to reveal the message.                   |
# ---------------------------------------------------------------

# All your code should go between these lines!
# ========================

# 0. Remove the first character in the code
code.slice!(0)

# 1. Insert the string "A EW?" at the code's 11th position. 
code.insert(11, "A EW? O")

# 2. Remove all instances of the characters 'Q', '?', and ','.
code.tr!("Q?,", "")

# 3. STOP SHOUTING. Make the entire code lowercase, for now.
code.downcase!

# 4. Reverse the order of the characters in the code.
code.reverse!

# 5. Capitalize the first letter of the code.
code.capitalize!

# 6. `puts` the code to reveal the message.
puts code


# ========================

# What a nice passcode.