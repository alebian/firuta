shared_examples 'param checker' do
  it 'adds the param' do
    expect(firuta.instance_variable_get(:@steps).first.size).to eq(1)
  end

  it 'the command added has the correct class' do
    expect(firuta.instance_variable_get(:@steps).first.first.class)
      .to eq(command_class)
  end

  it 'assigns the correct param' do
    expect(firuta.instance_variable_get(:@steps).first.first.instance_variable_get(:@params))
      .to eq([param])
  end
end

shared_examples 'param receiver' do
  context 'when passing params' do
    context 'as argument' do
      before { firuta.send(method, empty_proc, param) }

      it_behaves_like 'param checker'
    end

    context 'as option in hash' do
      before { firuta.send(method, with: param) }

      it_behaves_like 'param checker'
    end
  end
end
