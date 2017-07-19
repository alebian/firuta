shared_examples 'block checker' do
  it 'adds the block' do
    expect(firuta.instance_variable_get(:@steps).first.size).to eq(1)
  end

  it 'the command added has the correct class' do
    expect(firuta.instance_variable_get(:@steps).first.first.class)
      .to eq(command_class)
  end

  it 'assigns the correct block' do
    expect(firuta.instance_variable_get(:@steps).first.first.instance_variable_get(:@proc))
      .to eq(block)
  end
end

shared_examples 'block receiver' do
  context 'when passing block' do
    context 'as argument' do
      before { firuta.send(method, block) }

      it_behaves_like 'block checker'
    end

    context 'as option in hash' do
      before { firuta.send(method, function: block) }

      it_behaves_like 'block checker'
    end

    context 'as block' do
      before { firuta.send(method, nil, nil, {}, &block) }

      it_behaves_like 'block checker'
    end
  end
end
