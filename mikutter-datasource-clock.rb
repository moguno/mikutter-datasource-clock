#coding: utf-8

Plugin.create(:mikutter_datasource_clock) { 
  filter_extract_datasources { |datasources|
    datasources[:mikutter_datasource_clock] = "時計"

    [datasources]
  }

  on_period { |service|
    if service == Service.primary
      time = "現在の時刻は #{DateTime.now.strftime("%Y/%m/%d (%a) %H:%M")} だよ"
      message = Message.new(:message => time, :system => true)

      Plugin.call(:extract_receive_message, :mikutter_datasource_clock, Messages.new([message]))
    end
  }
}
