# spec/model/your_model_spec.rb
describe Animal do
  describe '#call_api'; do
     it 'gets a response from an api'; do
       VCR.use_cassette 'animal' do
          response = call_api('http://environment.ehp.qld.gov.au/species/?op=getspecies&family=acanthuridae')
          puts response.first
          response.first.should == 'hello world';
       end
     end
  end
end
