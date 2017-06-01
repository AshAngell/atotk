require 'rspec'

describe 'Fixnum class should now be extended with' do

  it 'abn? method should be present' do
    expect(4000.methods.include?(:abn?)).to be true
  end

  it 'tfn? method should be present' do
    expect(4000.methods.include?(:tfn?)).to be true
  end

  it 'abn? method should validate correct abn' do
    expect(55222288889.abn?).to be true
  end

  it 'tfn? method should validate correct tfn' do
    expect(648188535.tfn?).to be true
  end

  it 'abn? method should NOT validate dodgy abn' do
    expect(79123188889.abn?).to be false
  end

  it 'tfn? method should NOT validate dodgy tfn' do
    expect(999899582.tfn?).to be false
  end

end