##
# This module requires Metasploit: https://metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##

###
#
# This sample auxiliary module simply displays the selected action and
# registers a custom command that will show up when the module is used.
#
###
# put this modules in following location:
# location: ~/.msf4/modules/auxiliary/kfc/crazy_thursday/vivo50
#
require 'securerandom'
require 'time'

class MetasploitModule < Msf::Auxiliary
  Rank = ExcellentRanking
  def initialize(info = {})
    super(
      update_info(
        info,
        'Name' => 'KFC Thursday - Vivo 50',
        # The description can be multiple lines, but does not preserve formatting.
        'Description' => 'Copy of Sample Auxiliary Module',
        'Author' => ['Esonhugh <esonhughoutside@gmail.com>'],
        'License' => MSF_LICENSE,
        'Actions' => [
          [ 'Default Action', { 'Description' => 'This does something' } ],
          [ 'Another Action', { 'Description' => 'This does a different thing' } ]
        ],
        # The action(s) that will run as background job
        'PassiveActions' => [
          'Another Action'
        ],
        # https://github.com/rapid7/metasploit-framework/wiki/Definition-of-Module-Reliability,-Side-Effects,-and-Stability
        'Notes' => {
          'Stability' => [],
          'Reliability' => [],
          'SideEffects' => []
        },
        'DefaultAction' => 'Default Action',
      )
    )
  end

  def run
    print_status("Running this simple auxiliary module")
    print_status("Vivo 50.......")

    # today is what day?
    t = Time.new
    print_status(t.inspect)
    if t.thursday? === false
      print_error("Today is not Thursday....")
      return
    end
    print_good("Today is Thursday!")

    # random the money...
    get_money = SecureRandom.random_number(100)
    print_good("Got money #{get_money}")
    if get_money < 50
      print_error("Money is not enough.....")
      print_error("Buying fail....")
    else
      print_good("Using 50 to buy KFC Crazy Thursday Successfully!")
    end
  end

  # auxiliary modules can register new commands, they all call cmd_* to
  # dispatch them
end
