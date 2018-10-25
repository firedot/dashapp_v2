control 'check_pkg' do

 describe service('dashapp') do
    it { should be_enabled }
    it { should be_running }
  end

end
