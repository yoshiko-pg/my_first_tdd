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
			expect(ClosedRange.new(min, max).lower_end_point()).to eq min
		end
	end

	with_them do
		it "上端点を取得する" do
			expect(ClosedRange.new(min, max).upper_end_point()).to eq max
		end
	end

	with_them do
		it "文字列を取得する" do
			expect(ClosedRange.new(min, max).to_s()).to eq string
		end
	end


	context '引数異常の例外' do 

		describe do
			where(:min, :max) do
				[
					[8, 3],
					[200, 100],
					[500, 0],
				]
			end

			with_them do
				it "下端点より上端点が小さい場合" do
					expect {
						ClosedRange.new(min, max)
					}.to raise_error(ArgumentError, '下端点より上端点が小さい')
				end
			end
		end

		describe do
			where(:min, :max) do
				[
					['3', 8],
					[3, '8'],
					['a', 'b'],
					[3.0, 8],
					[3, '8.1'],
					[10, 1000000000000000000000], #Bignumに変換される
					[-99887766554433221100, 0], #Bignumに変換される
				]
			end

			with_them do
				it "下端点もしくは上端点に整数型以外を渡した場合" do
					expect {
						ClosedRange.new(min, max)
					}.to raise_error(ArgumentError, '引数が整数型でない')
				end
			end
		end

	end

end
