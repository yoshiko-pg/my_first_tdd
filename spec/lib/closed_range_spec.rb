# -*- encoding: utf-8 -*-
require 'spec_helper'

describe '閉区間' do

	where(:min, :max, :string) do
		[
			[3, 8, "[3,8]"],
			[100, 200, "[100,200]"],
			[0, 500, "[0,500]"],
			[-5, -3, "[-5,-3]"],
			[-100, 6, "[-100,6]"],
		]
	end

	with_them do
		it "下端点を取得する" do
			ClosedRange.new(min, max).getLowerEndPoint().should eq min
		end
	end

	with_them do
		it "上端点を取得する" do
			ClosedRange.new(min, max).getUpperEndPoint().should eq max
		end
	end

	with_them do
		it "文字列を取得する" do
			ClosedRange.new(min, max).toString().should eq string
		end
	end


	context "閉区間の例外" do 

		where(:min, :max) do
			[
				[8, 3],
				[200, 100],
				[500, 0],
			]
		end

		with_them do
			it "下端点より上端点が小さい場合に例外を投げる" do
				expect {
					ClosedRange.new(min, max)
				}.to raise_error(ArgumentError, '下端点より上端点が小さい')
			end
		end

	end

	it "下端点もしくは上端点に整数型以外を渡した場合に例外を投げる" do
			expect {
				ClosedRange.new('a', 8)
			}.to raise_error(ArgumentError, '引数が整数型でない')
	end

end
