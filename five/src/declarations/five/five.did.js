export const idlFactory = ({ IDL }) => {
  const Message = IDL.Record({
    'art' : IDL.Text,
    'time' : IDL.Int,
    'author' : IDL.Text,
  });
  return IDL.Service({
    'follow' : IDL.Func([IDL.Principal], [], []),
    'follows' : IDL.Func([], [IDL.Vec(IDL.Principal)], []),
    'get_name' : IDL.Func([], [IDL.Opt(IDL.Text)], []),
    'post' : IDL.Func([IDL.Text], [], []),
    'posts' : IDL.Func([], [IDL.Vec(Message)], []),
    'set_name' : IDL.Func([IDL.Text], [], ['oneway']),
    'timeline' : IDL.Func([], [IDL.Vec(Message)], []),
  });
};
export const init = ({ IDL }) => { return []; };
