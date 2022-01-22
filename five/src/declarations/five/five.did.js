export const idlFactory = ({ IDL }) => {
  const Message = IDL.Record({ 'art' : IDL.Text, 'time' : IDL.Int });
  return IDL.Service({
    'follow' : IDL.Func([IDL.Principal], [], []),
    'follows' : IDL.Func([], [IDL.Vec(IDL.Principal)], []),
    'post' : IDL.Func([IDL.Text], [], []),
    'posts' : IDL.Func([], [IDL.Vec(Message)], []),
    'timeline' : IDL.Func([], [IDL.Vec(Message)], []),
  });
};
export const init = ({ IDL }) => { return []; };
