# -*- encoding: utf-8 -*-
module NissenCollect

  class Action

    # 環境変数を設定する
    def initialize
      @@shopInfo = {
        :shopInfo=>{
          :shopCode=> ENV['NISSEN_COLLECT_SHOPCODE'],
          :shopPassword=> ENV['NISSEN_COLLECT_PASSWORD'],
          :terminalId=> ENV['NISSEN_COLLECT_TERMINALID']
        }
      }
    end

  end

end
